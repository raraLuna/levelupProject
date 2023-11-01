<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<div class="topnav">
			<div class="container-fluid">
				<nav class="navbar navbar-light navbar-expand-lg topnav-menu">

					<div class="collapse navbar-collapse active" id="topnav-menu-content">
						<ul class="navbar-nav active">

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-dashboard"
									role="button">
									<i class="bx bx-home-circle me-2"></i><span key="t-dashboards">Dashboards</span>
									<div class="arrow-down"></div>
								</a>
								<div class="dropdown-menu" aria-labelledby="topnav-dashboard">

									<a href="#" class="dropdown-item" key="t-default">Default</a>
								</div>
							</li>

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-more" role="button">
									<i class="bx bx-file me-2"></i><span key="t-extra-pages">Extra pages</span>
									<div class="arrow-down"></div>
								</a>
								<div class="dropdown-menu" aria-labelledby="topnav-more">
									
									<div class="dropdown">
										<a class="dropdown-item dropdown-toggle arrow-none" href="#" id="topnav-auth"
											role="button">
											<span key="t-authentication">Authentication</span>
											<div class="arrow-down"></div>
										</a>
										<div class="dropdown-menu" aria-labelledby="topnav-auth">
											<a href="/auth/login" class="dropdown-item" key="t-login">Login</a>
											<a href="/auth/login-2" class="dropdown-item" key="t-login-2">Login
												2</a>
											<a href="/auth/register" class="dropdown-item"
												key="t-register">Register</a>
											<a href="/auth/register-2" class="dropdown-item"
												key="t-register-2">Register 2</a>
											<a href="/auth/recoverpw" class="dropdown-item"
												key="t-recover-password">Recover Password</a>
											<a href="/auth/recoverpw-2" class="dropdown-item"
												key="t-recover-password-2">Recover Password 2</a>
											<a href="/auth/lock-screen" class="dropdown-item"
												key="t-lock-screen">Lock Screen</a>
											<a href="/auth/lock-screen-2" class="dropdown-item"
												key="t-lock-screen-2">Lock Screen 2</a>
											<a href="/auth/confirm-mail" class="dropdown-item"
												key="t-confirm-mail">Confirm Mail</a>
											<a href="/auth/confirm-mail-2" class="dropdown-item"
												key="t-confirm-mail-2">Confirm Mail 2</a>
											<a href="/auth/email-verification" class="dropdown-item"
												key="t-email-verification">Email verification</a>
											<a href="/auth/email-verification-2" class="dropdown-item"
												key="t-email-verification-2">Email verification 2</a>
											<a href="/auth/two-step-verification" class="dropdown-item"
												key="t-two-step-verification">Two step verification</a>
											<a href="/auth/two-step-verification-2" class="dropdown-item"
												key="t-two-step-verification-2">Two step verification 2</a>
										</div>
									</div>
									
								</div>
							</li>

							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle arrow-none" href="#" id="topnav-layout"
									role="button">
									<i class="bx bx-layout me-2"></i><span key="t-layouts">Layouts</span>
									<div class="arrow-down"></div>
								</a>
								<div class="dropdown-menu active" aria-labelledby="topnav-layout">
									<div class="dropdown">
										<a class="dropdown-item dropdown-toggle arrow-none" href="#"
											id="topnav-layout-verti" role="button">
											<span key="t-vertical">Vertical</span>
											<div class="arrow-down"></div>
										</a>
										<div class="dropdown-menu" aria-labelledby="topnav-layout-verti">
											<a href="/layouts-light-sidebar" class="dropdown-item"
												key="t-light-sidebar">Light Sidebar</a>
											<a href="/layouts-compact-sidebar" class="dropdown-item"
												key="t-compact-sidebar">Compact Sidebar</a>
											<a href="/layouts-icon-sidebar" class="dropdown-item"
												key="t-icon-sidebar">Icon Sidebar</a>
											<a href="/layouts-boxed" class="dropdown-item" key="t-boxed-width">Boxed
												Width</a>
											<a href="/layouts-preloader" class="dropdown-item"
												key="t-preloader">Preloader</a>
											<a href="/layouts-colored-sidebar" class="dropdown-item"
												key="t-colored-sidebar">Colored Sidebar</a>
											<a href="/layouts-scrollable" class="dropdown-item"
												key="t-scrollable">Scrollable</a>
										</div>
									</div>

									<div class="dropdown active">
										<a class="dropdown-item dropdown-toggle arrow-none" href="#"
											id="topnav-layout-hori" role="button">
											<span key="t-horizontal">Horizontal</span>
											<div class="arrow-down"></div>
										</a>
										<div class="dropdown-menu active" aria-labelledby="topnav-layout-hori">
											<a href="/layouts-horizontal" class="dropdown-item"
												key="t-horizontal">Horizontal</a>
											<a href="/layouts-hori-topbar-light" class="dropdown-item"
												key="t-topbar-light">Topbar light</a>
											<a href="/layouts-hori-boxed-width" class="dropdown-item"
												key="t-boxed-width">Boxed width</a>
											<a href="/layouts-hori-preloader" class="dropdown-item"
												key="t-preloader">Preloader</a>
											<a href="/layouts-hori-colored-header" class="dropdown-item"
												key="t-colored-topbar">Colored Header</a>
											<a href="/layouts-hori-scrollable" class="dropdown-item"
												key="t-scrollable">Scrollable</a>
										</div>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</nav>
			</div>
		</div>

		