package mailtest;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
     //   passAuth = new PasswordAuthentication("gardenfi1749", "yfdqkqxfiuyhtuvf");
        passAuth = new PasswordAuthentication("kshtestdev", "skscjswo1");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
