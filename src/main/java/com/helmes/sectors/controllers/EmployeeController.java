package com.helmes.sectors.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.helmes.sectors.models.Employee;
import com.helmes.sectors.models.Sector;
import com.helmes.sectors.repository.EmployeeRepository;
import com.helmes.sectors.repository.SectorRepository;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

@Controller
public class EmployeeController {

  private final EmployeeRepository employeeRepository;
  private final SectorRepository sectorRepository;

  @Autowired
  public EmployeeController(EmployeeRepository employeeRepository, SectorRepository sectorRepository) {
    this.employeeRepository = employeeRepository;
    this.sectorRepository = sectorRepository;
  }

  @GetMapping("/")
  public String employees() {
    return "redirect:/employees";
  }

  @GetMapping("/employees")
    public String viewEmployees(Model model) {
    List<Employee> employees = employeeRepository.findAll();
    model.addAttribute("employees", employees);
    return "employeeList";
  }

  @GetMapping("/employee/new")
  public String showEmployeeForm(Model model) {
      List<Sector> sectors = sectorRepository.findAll();
      model.addAttribute("employee", new Employee());
      model.addAttribute("allSectors", sectors);
      return "employeeForm";
  }

  @GetMapping("employee/{id}")
  public String viewEmployee(@PathVariable Long id, Model model) {
      Employee employee = employeeRepository.findById(id).get();

      List<Sector> sectors = sectorRepository.findAll();
      model.addAttribute("allSectors", sectors);
      model.addAttribute("employee", employee);
      return "employeeEdit";
  }

  @PostMapping("/employee")
  public String saveEmployee(@Valid @ModelAttribute Employee employee, BindingResult result, Model model) {
    if (employee.getAgreeToTerms() == false) {
      result.rejectValue(
      "agreeToTerms", 
      "error.employee", 
      "You must agree to the terms");
    }
    if (result.hasErrors()) {
      List<Sector> sectors = sectorRepository.findAll();
      model.addAttribute("employee", employee);
      model.addAttribute("allSectors", sectors);
      return "employeeForm";
     }    
    try {
      Employee persistedEmployee = employeeRepository.save(employee);
      return "redirect:/employee/" + persistedEmployee.getId();
    } catch (Exception e) {
        System.err.println("Error saving employee to database: " + e.getMessage());
        model.addAttribute("errorMessage", e.getMessage());
        return "error";
    }
  }

  @PutMapping("/employee")
  public String updateEmployee(@Valid @ModelAttribute Employee employee, BindingResult result, Model model) {
    if (employee.getAgreeToTerms() == false) {
      result.rejectValue(
      "agreeToTerms", 
      "error.employee", 
      "You must agree to the terms");
    }
    if (result.hasErrors()) {
      List<Sector> sectors = sectorRepository.findAll();
      model.addAttribute("employee", employee);
      model.addAttribute("allSectors", sectors);
      return "employeeEdit";
    } 
    try {
      System.out.println(employee.getId());
      employeeRepository.save(employee);
      model.addAttribute("employee", employee);
      return "redirect:/employee/" + employee.getId();
    } catch (Exception e) {
        System.err.println("Error updating employee to database: " + e.getMessage());
        model.addAttribute("errorMessage", e.getMessage());
        return "error";
    }
  }

  @DeleteMapping("/employee/{id}/delete")
  public String deleteEmployee(@PathVariable Long id) {
    employeeRepository.deleteById(id);
      return "redirect:/employees";
  }
  
}
