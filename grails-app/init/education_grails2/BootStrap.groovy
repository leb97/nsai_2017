package edukacja_grails2

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def userRole = Role.findOrSaveWhere(authority: 'ROLE_USER')
        def studentRole = Role.findOrSaveWhere(authority: 'ROLE_STUDENT')
        def teacherRole = Role.findOrSaveWhere(authority: 'ROLE_TEACHER')

        def admin = User.findOrSaveWhere(username: 'admin', password: 'admin', firstName: 'testAmin', lastName: 'testAmin', email: 'patryk.powilan@gmail.com')
        def user = User.findOrSaveWhere(username: 'user', password: 'user', firstName: 'testuser', lastName: 'testuser', email: 'user@user.com')
        def student = User.findOrSaveWhere(username: 'student', password: 'student', firstName: 'student', lastName: 'student', email: 'student@student.com')
        def teacher = User.findOrSaveWhere(username: 'teacher', password: 'teacher', firstName: 'teacher', lastName: 'teacher', email: 'teacher@teacher.com')

        def student2 = User.findOrSaveWhere(username: 'student2', password: 'student2', firstName: 'student', lastName: 'student', email: 'student@student.com')
        def teacher2 = User.findOrSaveWhere(username: 'teacher2', password: 'teacher2', firstName: 'teacher', lastName: 'teacher', email: 'teacher@teacher.com')

        def subject = Subject.findOrSaveWhere(name: 'Polski', user: teacher)
        def subject2 = Subject.findOrSaveWhere(name: 'Matemtyka', user: teacher)

        def score1 = Score.findOrSaveWhere(user: student, subject: subject, score: 2)
        def score2 = Score.findOrSaveWhere(user: student, subject: subject2, score: 4)
        def score3 = Score.findOrSaveWhere(user: student, subject: subject2, score: 5)
        def score4 = Score.findOrSaveWhere(user: student, subject: subject, score: 3)

        if(!admin.authorities.contains(adminRole)){
            UserRole.create(admin, adminRole, true)
        }
        if(!user.authorities.contains(userRole)){
            UserRole.create(user, userRole, true)
        }
        if(!student.authorities.contains(studentRole)){
            UserRole.create(student, studentRole, true)
        }
        if(!teacher.authorities.contains(teacherRole)){
            UserRole.create(teacher, teacherRole, true)
        }
        if(!student2.authorities.contains(studentRole)){
            UserRole.create(student2, studentRole, true)
        }
        if(!teacher2.authorities.contains(teacherRole)){
            UserRole.create(teacher2, teacherRole, true)
        }
    }
    def destroy = {
    }
}
