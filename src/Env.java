// Environment code for project smarthome
import java.lang.Math;

import jason.asSyntax.*;
import jason.environment.*;
import jason.asSyntax.parser.*;
import java.util.logging.*;
import java.lang.Math.*;
public class Env extends Environment {

    private Logger logger = Logger.getLogger("smarthome."+Env.class.getName());

    private boolean veszelyvan = false;

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
        double rnd = Math.random();
        switch(action.getFunctor()){
            case "gyujtas" -> {
                    addPercept(Literal.parseLiteral("tuz"));
                    veszelyvan=true;
                }
            case "mozgas" -> {
                if(!veszelyvan){
                    if(rnd>0.5){addPercept(Literal.parseLiteral("azonositasTrue"));}
                    else{addPercept(Literal.parseLiteral("azonositasFalse"));}
                }
            }
            case "ajtonyitas" -> {
                addPercept(Literal.parseLiteral("ajtonyitas"));
                ajtoNyitva = true;
            }
            case "ajtocsukas" -> {
                if(!veszelyvan){
                    addPercept(Literal.parseLiteral("ajtocsukas"));
                    ajtoNyitva = false;
                }
            }
            case "elmultAVeszely" -> {
                veszelyvan=false;
            }
            case "check" -> {
                if(Math.random() > 0.85){
                    addPercept(Literal.parseLiteral("dirt"));
                }
            }
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
