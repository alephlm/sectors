package com.helmes.sectors.models;

import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Employee {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private Long id;
  
  @Column(nullable = false)
  private String name;
  
  @Column(nullable = false)
  private boolean agreeToTerms;

  @Column(nullable = false)
  @ManyToMany(fetch = FetchType.EAGER) 
  @JoinTable(
    name = "employee_sectors", 
    joinColumns = @JoinColumn(name = "employee_id"), 
    inverseJoinColumns = @JoinColumn(name = "sector_id"))
  Set<Sector> sectors;

  public Employee() {}

  public Employee(String name, boolean agreeToTerms) {
    this.name = name;
    this.agreeToTerms = agreeToTerms;
  }

  public Long getId() {
    return this.id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public boolean getAgreeToTerms() {
    return agreeToTerms;
  }

  public void setAgreeToTerms(boolean agreeToTerms) {
    this.agreeToTerms = agreeToTerms;
  }

  public Set<Sector> getSectors() {
    return sectors;
  }

  public void setSectors(Set<Sector> sectors) {
      this.sectors = sectors;
  }

}
