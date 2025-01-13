# Breast Cancer Prediction Model

## Overview
This project is focused on predicting breast cancer using machine learning techniques. The model is trained on a dataset containing features extracted from digitized breast cancer biopsy images and provides predictions based on these features.

My goal is to study and visualise data about cancer to find patterns, trends, and factors that could improve understanding of this disease. We will use machine learning methods to uncover useful insights.


## Dataset
The dataset used for training the model includes features such as:
- Mean radius
- Mean texture
- Mean perimeter
- Mean area
- Mean smoothness
- Mean compactness
- Mean concavity
- Mean concave points
- Mean symmetry
- Mean fractal dimension

## Features
1. **Model Training**: Various machine learning algorithms were trained, and hyperparameter tuning was performed to select the best model.
2. **Model Evaluation**: Metrics such as accuracy, precision, recall, and F1 score were used to evaluate the model's performance.
3. **Model Saving**: The best-performing model was saved using Python's `pickle` module for future use.

## Machine Learning Models Used
- Logistic Regression
- Support Vector Classifier (SVC)
- Random Forest Classifier
- Gradient Boosting Classifier

## Installation and Setup
### Prerequisites
- Python 3.7 or above
- Libraries: `numpy`, `pandas`, `scikit-learn`, `matplotlib`, `pickle`

### Objectives - 
The basic outline of this project is to use the dataset 'Breast Cancer Diagnostic Data' to train various classification models and then compare their performance.

1) Exploratory Data Analysis (EDA): Looking for fundamental discrepancy in the dataset.

2) Model Analysis: After the EDA, we have decided to use Logistic Regression, Support Vector Machine and Naive Bayes classifier

3) Visualization: We will be working on visualising the models performance on various criteria and use the found insights to represent them visually using scatter plot, bar chart plot etc. 

### Installation
1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd breast_cancer_prediction
   ```
3. Install required libraries:
   ```bash
   pip install -r requirements.txt
   ```

## Usage
### Training the Model
1. Preprocess the data by normalizing and splitting it into training and test sets.
2. Train the models and evaluate them.
3. Save the best model using `pickle`.

### Prediction
Load the saved model and use it for predictions on new data:
```python
import pickle
import numpy as np

# Load the saved model
model = pickle.load(open('breast_cancer_model.pkl', 'rb'))

# Input data for prediction
input_data = np.array([mean_radius, mean_texture, mean_perimeter, mean_area,
                       mean_smoothness, mean_compactness, mean_concavity,
                       mean_concave_points, mean_symmetry, mean_fractal_dimension]).reshape(1, -1)

# Make a prediction
prediction = model.predict(input_data)
print("Prediction:", prediction)
```


### Repository Structure - 
```plaintext
BREAST-CANCER_PREDICTION_MODEL/
├── data/
│   ├── cancer_dataset.csv
|   └── Readme.md
├── plots/
│   └── Readme.md
├── docs/
│   └── Readme.md
├── about.qmd
├── proposal.html
├── proposal.qmd
└── Main.ipynb  
└── README.md


## Evaluation Metrics
The following metrics were used to evaluate the model's performance:
- **Accuracy**: Measures the percentage of correctly predicted instances.
- **Precision**: Indicates the proportion of true positive cases among predicted positive cases.
- **Recall**: Measures the proportion of actual positive cases that were correctly identified.
- **F1 Score**: Harmonic mean of precision and recall.

## Limitations
- The model's performance depends on the quality and size of the dataset.
- Predictions are based on specific features and may not generalize well to unseen data with significant variations.

## Future Enhancements
- Implement a web-based deployment for user-friendly predictions.
- Explore additional features or datasets for improved accuracy.
- Optimize the model using advanced techniques such as neural networks.

## Acknowledgments
- Dataset source: [Breast Cancer Wisconsin (Diagnostic) Dataset](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic))
- Tools and libraries: Python, scikit-learn, pandas, matplotlib

