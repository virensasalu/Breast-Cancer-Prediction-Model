## Cancer Dataset
The cancer_dataset.csv is a comprehensive dataset containing medical data for 569 cases of breast cancer. This dataset includes measurements related to tumor characteristics, which help identify patterns and factors that can influence cancer diagnosis and treatment. Below are details of the columns in this dataset:

### Dataset Overview
Total Entries: 569
Features: 33, including:
  1) Basic identifiers and labels (e.g., id, diagnosis)
  2) Measurements related to the tumor's size, shape, and texture at different stages.

### All Columns
## Columns

| Column Name               | Description                                                       |
|---------------------------|-------------------------------------------------------------------|
| `id`                      | Unique identifier for each case                                   |
| `diagnosis`               | Diagnosis result (M = Malignant, B = Benign)                      |
| `radius_mean`             | Mean of distances from the center to points on the tumor's edge   |
| `texture_mean`            | Standard deviation of gray-scale values                           |
| `perimeter_mean`          | Mean size of the tumor's perimeter                                |
| `area_mean`               | Mean area of the tumor                                            |
| `smoothness_mean`         | Mean of local variations in radius lengths                        |
| `compactness_mean`        | Mean of perimeter^2 / area - 1.0                                  |
| `concavity_mean`          | Mean of concave portions of the tumor contour                     |
| `concave points_mean`     | Mean number of concave points on the tumor                        |
| `symmetry_mean`           | Mean symmetry of the tumor shape                                  |
| `fractal_dimension_mean`  | Mean of "coastline approximation" - 1D measurements               |
| `radius_se`               | Standard error for the radius                                     |
| `texture_se`              | Standard error for the texture                                    |
| `perimeter_se`            | Standard error for the perimeter                                  |
| `area_se`                 | Standard error for the area                                       |
| `smoothness_se`           | Standard error for smoothness                                     |
| `compactness_se`          | Standard error for compactness                                    |
| `concavity_se`            | Standard error for concavity                                      |
| `concave points_se`       | Standard error for concave points                                 |
| `symmetry_se`             | Standard error for symmetry                                       |
| `fractal_dimension_se`    | Standard error for fractal dimension                              |
| `radius_worst`            | Worst (largest) value for radius                                  |
| `texture_worst`           | Worst value for texture                                           |
| `perimeter_worst`         | Worst value for perimeter                                         |
| `area_worst`              | Worst value for area                                              |
| `smoothness_worst`        | Worst value for smoothness                                        |
| `compactness_worst`       | Worst value for compactness                                       |
| `concavity_worst`         | Worst value for concavity                                         |
| `concave points_worst`    | Worst value for concave points                                    |
| `symmetry_worst`          | Worst value for symmetry                                          |
| `fractal_dimension_worst` | Worst value for fractal dimension                                 |
| `Unnamed: 32`             | Column with no data                                               |
