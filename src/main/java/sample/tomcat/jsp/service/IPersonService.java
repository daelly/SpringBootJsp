package sample.tomcat.jsp.service;

import java.util.List;

import org.springframework.data.domain.Page;

import sample.tomcat.jsp.data.Person;

public interface IPersonService {

	public Person get(long id);
	
	public void insert(Person person);
	
	public void update(Person person);
	
	public void delete(Person person);
	
	public void delete(long id);
	
	public Page<Person> findAll(int page,int size);
	
	public List<Person> findAll();
}
