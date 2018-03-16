package edukacja_grails2

class Subject {
    User user
    String name
    static constraints = {
    }

    Set<User> getTeachers() {
        (UserRole.findAllByRole(Role.findByAuthority("ROLE_TEACHER")))*.user as Set<User>
    }
}
