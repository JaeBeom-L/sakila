package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;
	private String title;
	private String description;
	private String releaseYear;
	private int languateId;
	private int originalLanguageId;
	private int rentalDuration;
	private double rentalDate;
	private int length;
	private double replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;
}
