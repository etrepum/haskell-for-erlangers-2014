-- sum type, 3 possible values
data Choice = Definitely
            | Possibly
            | NoWay

-- product type, 6 possible values (3 * 3)
data Choices = Choices Choice Choice

-- record syntax defines accessors automatically
data Choices = Choices { fstChoice :: Choice
                       , sndChoice :: Choice
                       }
