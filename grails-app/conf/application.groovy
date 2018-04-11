

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'edukacja_grails2.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'edukacja_grails2.UserRole'
grails.plugin.springsecurity.authority.className = 'edukacja_grails2.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.ui.register.postRegisterUrl = '/'
//grails.plugin.springsecurity.ui.register.emailBody = 'udalo sie zarejestrowac'
//grails.plugin.springsecurity.ui.register.emailFrom = 'oepco1992@gmail.com'
//grails.plugin.springsecurity.ui.register.emailSubject = 'Rejestracja'
grails.plugin.springsecurity.ui.register.defaultRoleNames = ['ROLE_STUDENT']

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
//	[pattern: '/**',             access: ['permitAll']],
	[pattern: '/auth',             			access: ['permitAll']],
	[pattern: '/register/**',     			access: ['permitAll']],
//admin patterns
	[pattern: '/role/**',         			access: ['ROLE_ADMIN']],
	[pattern: '/userRole/index/**',         access: ['ROLE_ADMIN']],
	[pattern: '/user/show/**',         		access: ['ROLE_ADMIN']],
	[pattern: '/user/edit/**',         		access: ['ROLE_ADMIN']],
	[pattern: '/user/update/**',         	access: ['ROLE_ADMIN', 'ROLE_TEACHER', 'ROLE_STUDENT']],
	[pattern: '/user/index',         		access: ['ROLE_ADMIN']],
	[pattern: '/userRole/create',         	access: ['ROLE_ADMIN']],
	[pattern: '/userRole/save',         	access: ['ROLE_ADMIN']],
	[pattern: '/userRole/show/**',         	access: ['ROLE_ADMIN']],
	[pattern: '/userRole/delete/**',        access: ['ROLE_ADMIN']],
	[pattern: '/subject/adminIndex',        access: ['ROLE_ADMIN']],
	[pattern: '/subject/create',         	access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/subject/save',         		access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/subject/teacherIndex',      access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/subject/showMy/**',         access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/subject/delete/**',         access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/score/adminIndex',        	access: ['ROLE_ADMIN']],
	[pattern: '/score/showTeacher/**',      access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/score/delete/**',         	access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/score/teacherindex',        access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/score/create',         		access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/score/save',         		access: ['ROLE_ADMIN', 'ROLE_TEACHER']],
	[pattern: '/user/showTeacher/**',       access: ['ROLE_ADMIN', 'ROLE_TEACHER', 'ROLE_STUDENT']],
	[pattern: '/user/showMy/**',         	access: ['ROLE_ADMIN', 'ROLE_TEACHER', 'ROLE_STUDENT']],
	[pattern: '/user/editMy/**',         	access: ['ROLE_ADMIN', 'ROLE_TEACHER', 'ROLE_STUDENT']],
//student patterns
	[pattern: '/score/studentindex',        access: ['ROLE_STUDENT']],
	[pattern: '/subject/showSubjectRO/**',  access: ['ROLE_STUDENT']],
//	[pattern: '/user/showTeacher/**',       access: ['ROLE_STUDENT']],
//	[pattern: '/user/showMy/**',         	access: ['ROLE_STUDENT']],
//	[pattern: '/user/editMy/**',         	access: ['ROLE_STUDENT']],
//	[pattern: '/user/update/**',         	access: ['ROLE_STUDENT']],
//teacher patterns
//	[pattern: '/subject/teacherIndex',      access: ['ROLE_TEACHER']],
//	[pattern: '/subject/create',         	access: ['ROLE_TEACHER']],
//	[pattern: '/subject/save',         		access: ['ROLE_TEACHER']],
//	[pattern: '/subject/showMy/**',         access: ['ROLE_TEACHER']],
//	[pattern: '/subject/delete/**',         access: ['ROLE_TEACHER']],
//	[pattern: '/score/teacherindex',        access: ['ROLE_TEACHER']],
//	[pattern: '/score/showTeacher/**',      access: ['ROLE_TEACHER']],
//	[pattern: '/score/delete/**',        	access: ['ROLE_TEACHER']],
//	[pattern: '/score/create',         		access: ['ROLE_TEACHER']],
//	[pattern: '/score/save',         		access: ['ROLE_TEACHER']],
//	[pattern: '/user/showTeacher/**',       access: ['ROLE_TEACHER']],
//	[pattern: '/user/showMy/**',         	access: ['ROLE_TEACHER']],
//	[pattern: '/user/editMy/**',         	access: ['ROLE_TEACHER']],
//	[pattern: '/user/update/**',        	access: ['ROLE_TEACHER']],

	[pattern: '/auth',           			access: ['permitAll']],
	[pattern: '/error',          			access: ['permitAll']],
	[pattern: '/index',          			access: ['permitAll']],
	[pattern: '/index.gsp',      			access: ['permitAll']],
	[pattern: '/shutdown',       			access: ['permitAll']],
	[pattern: '/assets/**',      			access: ['permitAll']],
	[pattern: '/**/js/**',       			access: ['permitAll']],
	[pattern: '/**/css/**',      			access: ['permitAll']],
	[pattern: '/**/images/**',   			access: ['permitAll']],
	[pattern: '/**/favicon.ico', 			access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]