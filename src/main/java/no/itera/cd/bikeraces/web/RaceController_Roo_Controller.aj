package no.itera.cd.bikeraces.web;

import java.lang.Long;
import java.lang.String;
import javax.validation.Valid;
import no.itera.cd.bikeraces.domain.Race;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect RaceController_Roo_Controller {
    
    @RequestMapping(value = "/race", method = RequestMethod.POST)
    public String RaceController.create(@Valid Race race, BindingResult result, ModelMap modelMap) {
        if (race == null) throw new IllegalArgumentException("A race is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("race", race);
            modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "race/create";
        }
        race.persist();
        return "redirect:/race/" + race.getId();
    }
    
    @RequestMapping(value = "/race/form", method = RequestMethod.GET)
    public String RaceController.createForm(ModelMap modelMap) {
        modelMap.addAttribute("race", new Race());
        modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "race/create";
    }
    
    @RequestMapping(value = "/race/{id}", method = RequestMethod.GET)
    public String RaceController.show(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        modelMap.addAttribute("race", Race.findRace(id));
        return "race/show";
    }
    
    @RequestMapping(value = "/race", method = RequestMethod.GET)
    public String RaceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, ModelMap modelMap) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            modelMap.addAttribute("races", Race.findRaceEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Race.countRaces() / sizeNo;
            modelMap.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            modelMap.addAttribute("races", Race.findAllRaces());
        }
        modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "race/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String RaceController.update(@Valid Race race, BindingResult result, ModelMap modelMap) {
        if (race == null) throw new IllegalArgumentException("A race is required");
        if (result.hasErrors()) {
            modelMap.addAttribute("race", race);
            modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
            return "race/update";
        }
        race.merge();
        return "redirect:/race/" + race.getId();
    }
    
    @RequestMapping(value = "/race/{id}/form", method = RequestMethod.GET)
    public String RaceController.updateForm(@PathVariable("id") Long id, ModelMap modelMap) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        modelMap.addAttribute("race", Race.findRace(id));
        modelMap.addAttribute("race_raceDate_date_format", org.joda.time.format.DateTimeFormat.patternForStyle("S-", org.springframework.context.i18n.LocaleContextHolder.getLocale()));
        return "race/update";
    }
    
    @RequestMapping(value = "/race/{id}", method = RequestMethod.DELETE)
    public String RaceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size) {
        if (id == null) throw new IllegalArgumentException("An Identifier is required");
        Race.findRace(id).remove();
        return "redirect:/race?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
}
