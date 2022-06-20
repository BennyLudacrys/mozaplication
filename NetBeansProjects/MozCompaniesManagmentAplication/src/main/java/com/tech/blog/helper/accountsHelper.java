package com.tech.blog.helper;

import com.tech.blog.entities.User;

public class accountsHelper {

    public void Save(User user) {
        if (this.isValid(user)) {
            user.setMessage("ok");
        }
    }

    private boolean isValid(User user) {
        if (user.getName().equals("")) {
            user.setMessage("Porfavor escreva o teu nome");
            return false;
        }
        if (user.getAbout().equals("")) {
            user.setMessage("Porfavor escreva algo sobre ti");
            return false;
        }
        if (user.getEmail().equals("")) {
            user.setMessage("Porfavor escreva o teu email");
            return false;
        }
        if (user.getGender().equals("")) {
            user.setMessage("Porfavor escreva o teu genero");
            return false;
        }
//        if (!user.getPassword().equals(user.getCpassword())) {
//            user.setMessage("palavra passe nao combina");
//            return false;
        //}
        if (user.getCpassword().equals("")) {
            user.setMessage("porfavor confirme a tua palavra passe");
            return false;
        }
        return false;
    }

    private boolean checkAvaliability(User user) {
        return true;
    }

    private boolean SaveUser(User user) {
        return false;
    }
    
}
