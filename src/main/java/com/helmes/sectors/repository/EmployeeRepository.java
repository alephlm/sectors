package com.helmes.sectors.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.helmes.sectors.models.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}