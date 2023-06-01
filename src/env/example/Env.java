// Environment code for project smarthome

import jason.asSyntax.*;
import jason.environment.*;
import jason.asSyntax.parser.*;

import java.util.logging.*;

public class Env extends Environment {

    private Logger logger = Logger.getLogger("smarthome."+Env.class.getName());

    private boolean tuzvan = false;
    private boolean oxigenhianyvan = false;

    /** Called before the MAS execution with the args informed in .mas2j */
    @Override
    public void init(String[] args) {
        super.init(args);
        try {
            addPercept(ASSyntax.parseLiteral("percept("+args[0]+")"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean executeAction(String agName, Structure action) {
        clearPercepts();

        if(action.getFunctor().equals("gyujtas")){
            addPercept(Literal.parseLiteral("tuz"));
        }else if (action.getFunctor().equals("gazszivargas")) {
            addPercept(Literal.parseLiteral("oxigenhiany"));
        } else if (action.getFunctor().equals("tuzvan(1)")) {
            tuzvan = true;
        } else {
            logger.info("executing: " + action + ", but not implemented!");
        }

        if(tuzvan){
            addPercept(Literal.parseLiteral("tuzvan(1)"));
        }

        if (true) { // you may improve this condition
             informAgsEnvironmentChanged();
        }
        return true; // the action was executed with success
    }

    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }
}
