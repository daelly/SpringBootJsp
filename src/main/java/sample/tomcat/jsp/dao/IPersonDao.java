package sample.tomcat.jsp.dao;

import org.springframework.data.repository.PagingAndSortingRepository;

import sample.tomcat.jsp.data.Person;

public interface IPersonDao extends PagingAndSortingRepository<Person, Long> {
	
}
