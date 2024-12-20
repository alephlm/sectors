package com.helmes.sectors.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.helmes.sectors.models.Sector;

@Repository
public interface SectorRepository extends JpaRepository<Sector, Long> {
}