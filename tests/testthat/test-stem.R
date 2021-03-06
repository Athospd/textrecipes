context("test-stem")

library(recipes)
library(textrecipes)

test_data <- tibble(text = c("I would not eat them here or there.",
                             "I would not eat them anywhere.",
                             "I would not eat green eggs and ham.",
                             "I do not like them, Sam-I-am.")
)

rec <- recipe(~ ., data = test_data)

test_that("stemming is done correctly", {
  rec <- rec %>%
    step_tokenize(text) %>%
    step_stem(text) 
  
  obj <- rec %>%
    prep(training = test_data, retain = TRUE)
  
  expect_equal(
    tokenizers::tokenize_words(test_data$text[1])[[1]] %>%
      SnowballC::wordStem(),
    juice(obj) %>% 
      slice(1) %>% 
      pull(text) %>%
      unlist()
  )
  
  expect_equal(dim(tidy(rec, 2)), c(1, 3))
  expect_equal(dim(tidy(obj, 2)), c(1, 3))
})

test_that("printing", {
  rec <- rec %>%
    step_tokenize(text) %>%
    step_stem(text)
  expect_output(print(rec))
  expect_output(prep(rec, training = test_data, verbose = TRUE))
})
