package no.itera.cd.bikeraces.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import no.itera.cd.bikeraces.domain.Race;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "race", automaticallyMaintainView = true, formBackingObject = Race.class)
@RequestMapping("/race/**")
@Controller
public class RaceController {
}
