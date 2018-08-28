package fi.ropasoft.bootdemo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RootController {
    private Logger logger = LoggerFactory.getLogger(RootController.class);

    @RequestMapping("/")
    public String index(){
        logger.debug("index() - start");
        return "{'name': 'index'}";
    }
}
