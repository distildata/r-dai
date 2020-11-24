
##########################################################################
#####                        EXAMPLE R SCRIPT                        #####
##########################################################################

setwd("/Users/jamesorton/Documents/Projects/R")

library(dai)

##### WE CAN LOAD THE DATA

dai.connect(uri = 'http://18.205.153.136:12345', username = 'h2oai', password = 'i-06f6ff82edc69fe8d')

Rdummycba <- dai.upload_dataset('Rloan.csv')

##### PERFORM STANDARD R-TYPE ANALYSIS

summary(Rdummycba)

##### SPLIT THE DATA

Rdummycba.splits <- dai.split_dataset(Rdummycba,
                                       output_name1 = 'train',
                                       output_name2 = 'test',
                                       ratio = .8,
                                       seed = 25,
                                       progress = FALSE)

##### AUTO FEATURE ENGINEERING AND MODEL TUNING

model <- dai.train(training_frame = Rdummycba.splits$train,
                   testing_frame = Rdummycba.splits$test,
                   target_col = 'bad_loan',
                   is_classification = T,
                   is_timeseries = F,
                   accuracy = 1, time = 1, interpretability = 10,
                   seed = 25)

##### MODEL INSPECTION

print(model)

summary(model)$score

##### PREDICTING ON NEW DATA

predictions <- predict(model, newdata = Rdummycba.splits$test)

head(predictions)

##### DOWNLOAD SCORING PIPELINES

dai.download_mojo(model, path = "/Users/jamesorton/Documents/Projects/R", force = TRUE)

dai.download_python_pipeline(model, path = "/Users/jamesorton/Documents/Projects/R", force = TRUE)

##### MANAGING DATASETS AND MODELS

datasets <- dai.list_datasets()
head(datasets)

models <- dai.list_models()
head(models)
