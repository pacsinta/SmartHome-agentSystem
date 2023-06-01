// Environment code for project smarthome
import java.lang.Math;

import jason.asSyntax.*;
import jason.environment.*;
import jason.asSyntax.parser.*;
import java.util.logging.*;
import java.lang.Math.*;
public class Env extends Environment {

    private Logger logger = Logger.getLogger("smarthome."+Env.class.getName());

    private boolean tuzvan = false;
    private boolean oxigenhianyvan = false;

    private boolean ajtoNyitva = false;

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

        switch(action.getFunctor()){
            case "gyujtas" -> addPercept(Literal.parseLiteral("tuz"));
            case "gazszivargas" -> addPercept(Literal.parseLiteral("oxigenhiany"));
            case "tuzvan(1)" -> addPercept(Literal.parseLiteral("tuzvan(1)"));
            case "mozgas" -> {
                double rnd = Math.random();
                    if(rnd>0.5){addPercept(Literal.parseLiteral("azonositasTrue"));}
                    else{addPercept(Literal.parseLiteral("azonositasFalse"));}
                }
            case "ajtonyitas" -> {
                addPercept(Literal.parseLiteral("ajtonyitas"));
                ajtoNyitva = true;
            }
            case "ajtocsukas" -> {
                    if(!tuzvan&&!oxigenhianyvan){
                        addPercept(Literal.parseLiteral("ajtocsukas"));
                        ajtoNyitva = false;
                    }
                }
            case "uresahaz" -> addPercept(Literal.parseLiteral("uresahaz"));
            default -> logger.info("executing: " + action + ", but not implemented!");
        }

        informAgsEnvironmentChanged();
        return true; // the action was executed with success
    }

    /** Called before the end of MAS execution */
    @Override
    public void stop() {
        super.stop();
    }
}
