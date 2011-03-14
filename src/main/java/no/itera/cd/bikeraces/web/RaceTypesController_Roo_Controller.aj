package no.itera.cd.bikeraces.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import no.itera.cd.bikeraces.domain.RaceTypes;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RaceTypesController_Roo_Controller {
    
    @RequestMapping(value = "/racetypes", method = RequestMethod.POST)
    public String RaceTypesController.create(@Valid RaceTypes raceTypes, BindingResult result, ModelMap modelMap) {
        if (raceTypes == null) throw new IllegalArgumentException("A raceTypes is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("raceTypes", raceTypes);
            return "racetypes/create";
        }
        raceTypes.persist();
        return "redirect:/racetypes/" + raceTypes.getId();
    }
    
    @RequestMapping(value = "/racetypes/form", method = RequestMethod.GET)
    public String RaceTypesController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("raceTypes", new RaceTypes());
        return "racetypes/create";
    }
    
    @RequestMapping(value = "/racetypes/{id}", method = RequestMethod.GET)
    public String RaceTypesController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("raceTypes", RaceTypes.findRaceTypes(id));
        return "racetypes/show";
    }
    
    @RequestMapping(value = "/racetypes", method = RequestMethod.GET)
    public String RaceTypesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("racetypeses", RaceTypes.findRaceTypesEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) RaceTypes.countRaceTypeses() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("racetypeses", RaceTypes.findAllRaceTypeses());
        }
        return "racetypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RaceTypesController.update(@Valid RaceTypes raceTypes, BindingResult result, ModelMap modelMap) {
        if (raceTypes == null) throw new IllegalArgumentException("A raceTypes is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("raceTypes", raceTypes);
            return "racetypes/update";
        }
        raceTypes.merge();
        return "redirect:/racetypes/" + raceTypes.getId();
    }
    
    @RequestMapping(value = "/racetypes/{id}/form", method = RequestMethod.GET)
    public String RaceTypesController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("raceTypes", RaceTypes.findRaceTypes(id));
        return "racetypes/update";
    }
    
    @RequestMapping(value = "/racetypes/{id}", method = RequestMethod.DELETE)
    public String RaceTypesController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        RaceTypes.findRaceTypes(id).remove();
        return "redirect:/racetypes?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
