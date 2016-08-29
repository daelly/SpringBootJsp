package sample.tomcat.jsp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sample.tomcat.jsp.data.Person;
import sample.tomcat.jsp.service.IPersonService;


@Controller
@RequestMapping("/backbone")
public class BackboneController extends BaseController {
	
	@Autowired
	IPersonService personService;

	@RequestMapping("/")
	public String home(){
		return viewName("home");
	}
	
	@RequestMapping("/fetch")
	@ResponseBody
	public Person fetch(){
		Person person = new Person();
		person.setName("daelly");
		person.setAge(25);
		person.setSex(false);
		return person;
	} 
	
	@RequestMapping(value="/save",method={RequestMethod.POST})
	@ResponseBody
	public Person create(@RequestBody Person person){
		personService.insert(person);
		return person;
	}
	
	@RequestMapping(value="/save/{id}",method={RequestMethod.PUT})
	@ResponseBody
	public Person update(@PathVariable("id") Long id,@RequestBody Person person){
		personService.update(person);
		return person;
	}
	@RequestMapping(value="/save/{id}",method={RequestMethod.PUT,RequestMethod.DELETE,RequestMethod.POST})
	@ResponseBody
	public void delete(@PathVariable("id") Long id){
		personService.delete(id);
	}
}
