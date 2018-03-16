package edukacja_grails2

class Score {
    User user
    Subject subject
    Integer score
    static constraints = {
        score(range: 1..5)
    }

    Set<Subject> getSubjects(String username) {
        (Subject.findAllByUser(User.findByUsername(username))) as Set<Subject>
    }

    Set<User> getStudents() {
        (UserRole.findAllByRole(Role.findByAuthority("ROLE_STUDENT")))*.user as Set<User>
    }

    List<Score> getStudentScores() {
        (Score.findAllByUser(User.findByUsername("student")) as List<Score>)
    }
}
