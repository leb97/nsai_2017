

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'edukacja_grails2.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'edukacja_grails2.UserRole'
grails.plugin.springsecurity.authority.className = 'edukacja_grails2.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.ui.register.postRegisterUrl = '/'
//grails.plugin.springsecurity.ui.register.emailBody = 'udalo sie zarejestrowac'
//grails.plugin.springsecurity.ui.register.emailFrom = 'oepco1992@gmail.com'
//grails.plugin.springsecurity.ui.register.emailSubject = 'Rejestracja'
grails.plugin.springsecurity.ui.register.defaultRoleNames = ['ROLE_USER']

grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/**',             access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]