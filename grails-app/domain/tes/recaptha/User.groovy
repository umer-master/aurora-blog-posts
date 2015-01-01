package tes.recaptha

class User {

    static constraints = {
        email(email:true)
        password(blank:false, password:true)
    }

    Long id
    Long version
    String email
    String password

    String toString(){
        "$email"
    }
}
