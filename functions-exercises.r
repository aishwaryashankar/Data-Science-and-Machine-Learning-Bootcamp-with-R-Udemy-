# EXAMPLE 1: Create a function that takes in a name as a string argument, and prints out "Hello name"

hello <- function(name)
  {
  print(paste("Hello",name))
  }
hello("Sam")

# EXAMPLE 2: Create a function that takes in a name as a string argument and returns a string of the form - "Hello name"
hello <- function(name)
  {
  return (paste("Hello",name))
  }
ret <- hello("Sam")
print(ret)

# Ex 1: Create a function that will return the product of two integers.
product <- function(x,y)
  {
  return(x*y)
  }
print(product(3,4))

# Ex 2: Create a function that accepts two arguments, an integer and a vector of integers. It returns TRUE if the integer is present in the vector, otherwise it returns FALSE. Make sure you pay careful attention to your placement of the return(FALSE) line in your function!
present <- function(num, vec)
  {
    for (item in vec)
      {
      if (item == num)
        {
        return(TRUE)
        }
      }
  return(FALSE)
  }
print(present(2,c(1,2,3)))
print(present(2,c(1,4,5)))


# Ex 3: Create a function that accepts two arguments, an integer and a vector of integers. It returns the count of the number of occurences of the integer in the input vector.
num_count <- function(num,vec)
  {
  count <- 0
  for (item in vec)
    {
    if (item == num)
      {
      count <- count + 1
      }
    }
  return(count)
  }
print(num_count(2,c(1,1,2,2,3,3)))
print(num_count(1,c(1,1,2,2,3,1,4,5,5,2,1,3)))

# Ex 4: We want to ship bars of aluminum. We will create a function that accepts an integer representing the requested kilograms of aluminum for the package to be shipped. To fullfill these order, we have small bars (1 kilogram each) and big bars (5 kilograms each). Return the least number of bars needed. For example, a load of 6 kg requires a minimum of two bars (1 5kg bars and 1 1kg bars). A load of 17 kg requires a minimum of 5 bars (3 5kg bars and 2 1kg bars).

# Ex 5: Create a function that accepts 3 integer values and returns their sum. However, if an integer value is evenly divisible by 3, then it does not count towards the sum. Return zero if all numbers are evenly divisible by 3. Hint: You may want to use the append() function.

summer <- function(x,y,z)
  {
  vec <- c(x,y,z)
  sum <- 0
  if (x%%3 == 0 & y%%3 == 0 & x%%3 == 0)
    {
    return(0)
    }
  else
    {
      for (num in vec)
        {
        if (num%%3 != 0)
          {
          sum <- sum+num
          }
        }
    }
  return(sum)
  }
print(summer(7,2,3))
print(summer(3,6,9))
print(summer(9,11,12))

# Ex 6: Create a function that will return TRUE if an input integer is prime. Otherwise, return FALSE. You may want to look into the any() function. There are many possible solutions to this problem.
prime_check <- function(num)
  {
  vec <- c()
  for (x in 2:10)
    {
    if (x!=num)
      {
      vec <- append(vec,c(x))
      }
    }
  for (x in vec)
    {
    if (num%%x==0)
      {
      return(FALSE)
      }
      
    }
  return(TRUE)
  }
prime_check(2)
prime_check(5)
prime_check(4)
prime_check(237)
prime_check(131)