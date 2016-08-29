package sample.tomcat.jsp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sample.tomcat.jsp.data.Person;
import sample.tomcat.jsp.service.IPersonService;

@RequestMapping("/person")
@Controller
public class PersonController extends BaseController {
	
	@Autowired
	IPersonService personService;
	
	@RequestMapping("/index")
	public String index(){
		return viewName("index");
	}

	@RequestMapping("/list")
	@ResponseBody
	public List<Person> list(){
		List<Person> persons = personService.findAll();
		return persons;
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public Page<Person> page(int page,int size){
		Page<Person> p = personService.findAll(page, size);
		return p;
	}
	
	@RequestMapping(value="/save",method={RequestMethod.POST})
	@ResponseBody
	public Person insert(@RequestBody Person person){
		personService.insert(person);
		return person;
	}
	
	@RequestMapping(value="/save/{id}",method={RequestMethod.PUT})
	@ResponseBody
	public Person update(@PathVariable("id") Long id,@RequestBody Person person){
		personService.update(person);
		return person;
	}
	@RequestMapping(value="/save/{id}",method={RequestMethod.DELETE})
	@ResponseBody
	public void delete(@PathVariable("id") Long id){
		personService.delete(id);
	}
}
