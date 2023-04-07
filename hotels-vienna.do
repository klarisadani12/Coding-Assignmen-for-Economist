* Import data from .csv file
import delimited filename.csv

* Convert string variables to numeric

* import delimited 
C:\Users\Dani_Klarisa\Desktop\hotels-vienna.csv
(24 vars, 428 obs)

destring rating_count, replace
destring price, replace
destring stars, replace
destring ratingta_count, replace

* Handle missing values
replace price = 0 if missing(price)
drop if missing(city_actual) | missing(rating_count) | missing(stars) | missing(price) | missing(city) | missing(ratingta) | missing(ratingta_count)

* Keep and drop variables
keep country city_actual rating_count center1label center2label neighbourhood price city stars ratingta ratingta_count scarce_room hotel_id offer offer_cat year month weekend holiday distance distance_alter accommodation_e nnights rating

* Generate new variables
generate total_ratings = real(rating_count) + real(ratingta_count)
generate log_price = ln(price)
generate log_distance = ln(distance)

* Run OLS regression
regress price stars distance log_distance nnights holiday i.offer i.center1label i.center2label i.city i.year

* Create a scatter plot
scatter price distance

* Save cleaned and filtered data
save cleaned_data.dta

* Save the graph as a file
graph export scatterplot.png, replace
