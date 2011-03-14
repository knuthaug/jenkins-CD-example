package no.itera.cd.bikeraces.web;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import no.itera.cd.bikeraces.domain.RaceTypes;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@RooWebScaffold(path = "racetypes", automaticallyMaintainView = true, formBackingObject = RaceTypes.class)
@RequestMapping("/racetypes/**")
@Controller
public class RaceTypesController {
}
