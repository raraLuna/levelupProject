# selenium 모듈을 사용한 동적 웹 크롤링 프로젝트

# path : crawling\\crawling_run.py
# moduel : crawling.crawling_run
# 동적 웹 크롤링 구동하는 스크립트

# 동적 웹크롤링 : selenium 모듈 사용함 => 외부 모듈이므로 설치해야 함
# selenium 모듈은 웹브라우저와 연동해서,
# 브라우저에 입력된 웹사이트와 이 사이트의 검색 필드의 검색 키워드를
# 파이썬을 통해서 입력받아서 해당 사이트로 전송해서
# 검색 필드 태그의 값으로 적용시켜서 검색을 실행하게 함 : 원격 검색
# 검색 결과 페이지가 브라우저에 출력됨 => 파이썬에서 읽어와서 분석함
# 동적 웹 크롤링의 동작 :
# 브라우저 구동 >> 사이트 접속 >> 검색 필드 태그 찾음 >> 검색 키워드를 전송함
# >> 브라우저 웹페이지에서 검색 적용 >> 검색 실행 >> 잠시 대기 >> 브라우저에 검색 결과 출력
# >> 파이썬으로 읽어옴 >> 분석

# import 방법
# import 모듈명 [as 줄임말]  => 모듈이 가진 전체 내용이 임포트됨
# 모듈이 가진 일부 항목만 선택해서 임포트할 수 있음
# from 모듈명 import 선택항목명[, 선택항목, 선택항목, 하위모듈명, 함수명, 클래스명, .......]
from selenium import webdriver as wd
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup as bs
from selenium.webdriver.common.by import By
# 명시적 대기를 위해 (waiting 을 명시함)
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time

# DB 저장 처리용 모듈
from model.tour_model import TourModel
from model_vo.tour import TourInfo


# selenium 과 연결할 브라우저 선택 : 크롬(chrome)
# 현재 설치 사용중인 크롬 브라우저의 버전 확인함
#  => 브라우저 우측 상단 점3개 > 도움말 > Chrome 정보 > 버전정보 확인 : 117.0.5938.89 (최신 버전으로)
# 웹에서 '크롬 드라이버' 검색 > 확인된 버전과 같은 드라이버 zip 을 다운받음
# 압축 풀어서 압축푼 폴더 안의 exe 파일을 현재 프로젝트 폴더로 복사함

def run():
    # 크롬 드라이버 등록
    # Mac 용
    # driver = wd.Chrome( '../chromedriver')
    # 윈도우용 (./ : 현재 폴더, ../ : 상위폴더
    driver = wd.Chrome(service=Service('./chromedriver.exe'))

    # 접속할 테스트 사이트 url 연결 확인 ------------------------------
    main_url = 'https://store.steampowered.com/charts/mostplayed/'
    # main_url = 'https://news.naver.com''
    # 또는 키보드로 입력받아서 적용할 수도 있음
    # main_url = input('접속할 웹사이트 url 입력 : ')

    # 사이트 접속
    driver.get(main_url)  # 실행 확인
    # time.sleep(3)  # 3초 대기

    # 해당 페이지의 검색에 전달할 검색 키워드 정하기 : 입력을 통해서 정해도 됨
    # keyword = '로마여행'    # keyword = input('검색할 키워드 : ')
    # 검색 결과 저장할 리스트
    tour_list = []

    # 접속한 페이지의 검색입력필드 찾아서 검색 키워드 입력 실행되게 처리 ----------------------
    # 검색필드 태그(element) 는 브라우저 '개발자도구 > Elements 탭' 에서 찾음
    # 찾은 앨리먼트 태그에서 마우스 우클릭 > copy > copy selector 선택함
    # input 태그의 id 명 : txtHeaderInput
    # 파이썬에서 해당 페이지의 검색 input 에 검색 키워드 전송함
    # input_tag = driver.find_element(By.ID, 'query')
    # print(input_tag)
    # input_tag .send_keys(keyword)
    # 해당 웹페이지 검색 input 에 '로마' 자동 입력됨

    #  검색 버튼 클릭 작동
    # button 태그 id 명 : btnHeaderInput
    # driver.find_element(By.CSS_SELECTOR, 'form#sform > fieldset > button.btn_search').click()

    # 잠시 대기 => 검색 결과 페이지가 로드되고 (브라우저에 출력) 나서
    # 바로 데이터를 획득하는 행위는 명시적으로 (코드상으로 표기) 대기시켜야 함
    # 획득할 데이터가 발견될 때까지 대기시킴
    # 대기 방법 : 명시적 대기와 암묵적 대기 2가지임

    # 명시적 대기 : 요구한 앨리먼트를 찾을 때까지 대기시킴
    # #nxTsOv > div > div.api_subject_bx._travel_header > div.cm_content_wrap > div.cm_content_area._cm_content_area_reservation > div > div.SummaryReservationTabs-dGxaq > div.content-cXcsG > div > div > div.information-Mr2HB._scroller > ul > li:nth-child(10)
    #  검색한 여행상품 목록 5개가 다 출력될 때까지 기다리게 설정
    # try:
    #  element = WebDriverWait(driver, 10).until(EC.presence_of_element_located(\
    #    (By.CSS_SELECTOR, '#nxTsOv > div > div.api_subject_bx._travel_header > div.cm_content_wrap > div.cm_content_area._cm_content_area_reservation > div > div.SummaryReservationTabs-dGxaq > div.content-cXcsG > div > div > div.information-Mr2HB._scroller > ul > li:nth-child(10)')))
    # 지정한 앨리먼트 위치를 확인하면 대기 종료됨
    # time.sleep(10)
    # except Exception as msg:
    #  print('대기 요청 오류 : ', msg)

    # 암묵적 대기 :
    # DOM(Document Object Model : 태그 사용 계층 구조)이
    #  전부 다 브라우저에 로드될 때까지(모두 읽어들일 때까지) 대기하게 하고,
    #  먼저 로드되면 바로 태그 앨리먼트를 찾도록 진행함
    # 앨리먼트 찾을 시간(초)을 지정하면, 지정 시간동안 DOM 풀링을 지시할 수 있음
    driver.implicitly_wait(10)

    # 절대적 대기 설정
    # time.sleep(10)  # 10초 대기

    # 검색 결과 페이지에서, '로마' 표시 영역의 '가볼만한 곳' 클릭해서
    # 여행지 정보 표시되게 함
    # nxTsOv > div > div.api_subject_bx._travel_header > div.PanelHeader-vpb6F.cm_top_wrap > div.sub_tap_area > div > ul > li:nth-child(4) > a
    # driver.find_element(By.CSS_SELECTOR, '#nxTsOv > div > div.api_subject_bx._travel_header > div.PanelHeader-vpb6F.cm_top_wrap > div.sub_tap_area > div > ul > li:nth-child(4) > a').click()
    # time.sleep(3)

    # 해당 페이지 영역에서 데이터를 가져올 때
    # 혹시 로그인이 필요한 경우에는 로그인 세션 관리 필요함
    # 데이터가 많으면 세션 타임아웃에 의해 자동 로그아웃될 수 있으므로
    # 특정 단위별로 로그아웃하고, 다시 로그인하는 처리가 필요함
    #  => loop 문 돌려서 일괄적으로 접근 처리 필요함 : 메타 정보 획득
    # searchModule.SetCategoryList(1, '') 자바스크립트를 실행
    #  => 해당 웹페이지에서 제공하는 자바스크립트 함수를 찾아내서 실행해 봄
    # 1부터 16까지 테스트해 본다면
    # for page in range(1, 17):  => 게시된 페이지글 넘겼을 때의 현상 확인

    # 예 : 게시판 페이지 하단의 div.pageNumBox > ul > li 태그 클릭
    # 페이지를 클릭해서 게시 정보를 가지고 오도록 해 봄
    # 즉, 데이터 읽어 오는 도중에 한번씩 페이지 이동 처리를 하게 하라는 의미임
    '''
    page_elements = driver.find_elements(By.CSS_SELECTOR, 'div.pageNumBox > ul > li')
    pages = len(page_elements)
    for page in range(1, pages):
        try:
            # 찾아낸 자바스크립트 구동하기 예: 팝업창 출력, 페이지 이동 등
            # 아래의 코드는 해당 페이지에서 제공하는 페이지이동 처리용 스크립트임
            driver.execute_script('searchModule.SetCategoryList(%s, '') ' % page)
            page_elements[page - 1].click()
            time.sleep(2)
            print('%s 페이지로 이동 확인'% page)
    '''
    # 검색한 여행지 기본정보에서 데이터 추출하기
    # 해당 여행지 정보 갯수 조회
    item_list = driver.find_elements(By.CSS_SELECTOR,
                                     '#page_root > div:nth-child(5) > div > div > div > div.weeklytopsellers_ChartPlaceholder_3sJkw > table > tbody > tr')
    print('게임 정보 갯수 : ', len(item_list))

    # 여행지 정보 목록 하나씩 접근해서, 각 항목 안의 값 추출
    # 추출할 값 : 순위(rank), 여행지 이름(name), 여행지 설명(description), 메타정보(meta)
    for li in item_list:
        # rank = li.find_element(By.CSS_SELECTOR, 'div > div > div > a > figure > span').text
        name = li.find_element(By.CSS_SELECTOR,
                               'div > div > div > div.weeklytopsellers_ChartPlaceholder_3sJkw > table > tbody > tr > td.weeklytopsellers_CapsuleCell_18kGH > a > div').text
        description = li.find_element(By.CSS_SELECTOR,
                                      'div > div > div > div.weeklytopsellers_ChartPlaceholder_3sJkw > table > tbody > tr > td.weeklytopsellers_ConcurrentCell_3L0CD').text.replace(
            ',', '')
        meta = li.find_element(By.CSS_SELECTOR,
                               'div > div > div > div.weeklytopsellers_ChartPlaceholder_3sJkw > table > tbody > tr > td.weeklytopsellers_PeakInGameCell_yJB7D').text.replace(
            ',', '')

        # 딕셔너리로 저장한 경우
        # info = dict()
        # info['rank'] = rank
        # info['name'] = name
        # info['description'] = description
        # info['meta'] = meta

        # 튜플로 저장한 경우
        info = (name, description, meta)
        tour_list.append(info)
    print(tour_list)
    # 오라클 테스트웹 계정에 저장 처리
    tm = TourModel()
    # 기존 테이블에 저장된 정보 모두 지우기
    tm.delete_all()

    # 여행지 리스트에 저장된 정보들 출력 & db 에 저장 처리
    for tour in tour_list:
        tm.insert_tour(tour)

    # db 에 저장된 정보 출력 확인
    resultset = tm.select_all()
    print(resultset)
    for tour in resultset:
        print(tour)

    # 브라우저 종료
    driver.close()  # 크롬 브라우저 닫기
    driver.quit()  # 드라이버 종료

    return  # main 으로 리턴 : 프로세스 종료


# run() ----------------------------------------------------------------------------------------------------


# 프로젝트 start
if __name__ == '__main__':
    run()

