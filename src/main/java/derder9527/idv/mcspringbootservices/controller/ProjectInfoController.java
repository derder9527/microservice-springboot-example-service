package derder9527.idv.mcspringbootservices.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/info")
public class ProjectInfoController {

    @Value("${mc.project.name}")
    private String appName;

    @Value("${mc.project.version}")
    private String version;


    @RequestMapping("/version")
    public String getVersion() {
        return version;
    }

    @RequestMapping("/appName")
    public String getAppName() {
        return appName;
    }

    @RequestMapping("/all")
    public String getAll() {
        return appName + "\n" + version;
    }


}
