package sample.tomcat.jsp.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import sample.tomcat.jsp.dao.IPersonDao;
import sample.tomcat.jsp.data.Person;
import sample.tomcat.jsp.service.IPersonService;

@Service
public class PersonServiceImpl implements IPersonService {
	
	@Autowired
	IPersonDao personDao;
	
	@Override
	public Person get(long id) {
		return personDao.findOne(id);
	}

	@Override
	public void insert(Person person) {
		personDao.save(person);
	}

	@Override
	public void update(Person person) {
		personDao.save(person);
	}

	@Override
	public void delete(Person person) {
		personDao.delete(person);
	}

	@Override
	public void delete(long id) {
		if(personDao.exists(id)){
			personDao.delete(id);
		}
	}

	@Override
	public Page<Person> findAll(int page,int size) {
		Pageable pageable = new PageRequest(page, size);
		Page<Person> p = personDao.findAll(pageable);
		return p;
	}

	@Override
	public List<Person> findAll() {
		Iterable<Person> it = personDao.findAll();
		List<Person> list = new ArrayList<Person>();
		for (Person person : it) {
			list.add(person);
		}
		return list;
	}

}
