package jay.springboot_books_apps.Controller;

import jay.springboot_books_apps.Model.Publisher;
import jay.springboot_books_apps.Service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class PublisherController {

    @Autowired
    private PublisherService publisherService;

    @GetMapping("/publishers")
    public String findAllPublishers(Model model){
        model.addAttribute("publishers", publisherService.findAllPublishers());
        return "views/publishers";
    }

    @GetMapping("/remove-publisher/{id}")
    public String deletePublisher(@PathVariable Long id, Model model){
        publisherService.deletePublisher(id);
        model.addAttribute("publishers", publisherService.findAllPublishers());
        return "views/publishers";
    }

    @GetMapping("update-publisher/{id}")
    public String updatePublisher(@PathVariable Long id, Model model){
        model.addAttribute("publisher", publisherService.findPublisherById(id));
        return "views/update-publisher";
    }

    @PostMapping("/update-publisher/{id}")
    public String saveUpdatePublisher(@PathVariable Long id, Publisher publisher, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors())
            return "views/update-publisher";
        publisherService.updatePublisher(publisher);
        model.addAttribute("publishers", publisherService.findAllPublishers());
        return "redirect:/publishers";
    }

    @GetMapping("/add-publisher")
    public String showCreatePage(Publisher publisher){
        return "views/add-publisher";
    }

    @PostMapping("/save-publisher")
    public String createPublisher(Publisher publisher, BindingResult result, Model model){
        if(result.hasErrors())
            return "views/add-publisher";
        publisherService.cretePublisher(publisher);
        model.addAttribute("publishers",publisherService.findAllPublishers());
        return "redirect:/publishers";
    }
}
