package pets;

import com.intuit.karate.junit5.Karate;
public class PetsRunner {

    @Karate.Test
    Karate testAll(){
        return Karate.run().relativeTo(getClass());
    }

    @Karate.Test
    Karate firstTestCase(){ return Karate.run().tags("@First").relativeTo(getClass());}
    @Karate.Test
    Karate secondTestCase(){
        return Karate.run().tags("@Second").relativeTo(getClass());
    }
    @Karate.Test
    Karate thirdTestCase(){
        return Karate.run().tags("@Third").relativeTo(getClass());
    }
    @Karate.Test
    Karate fourthTestCase(){
        return Karate.run().tags("@Fourth").relativeTo(getClass());
    }
}
