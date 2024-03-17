# ccwc
WC - John Crickett's Coding Challenge #1

This is an implementation of the Unic command line tool `wc`. This is a solution to the Week 1 problem in [John Crickett's Coding Challenges](https://codingchallenges.fyi/challenges/challenge-wc/).

## Getting Started

1. **Clone Repository:**
   
   ```bash
   git clone https://github.com/AdityaCH1997/ccwc.git
   cd ccwc
   ```
2. **Check If Script is executable:**
   
   ```bash
   ls -al
   ```

   If script does not have `x` in the permissions add permission using following command

   ```bash
   chmod +x ccwc.sh
   ```
   
4. **Source Script:**

   ```bash
   source ccwc.sh
   ```

5. **Test Script:**

   * Count the number of bytes in a file
   ```bash
   ccwc -c test.txt
   ```

   * Count the number of lines in a file
   ```bash
   ccwc -l test.txt
   ```

   * Count the number of characters in a file
   ```bash
   ccwc -m test.txt
   ```

   * Count the number of words in a file
   ```bash
   ccwc -w test.txt
   ```

   * Default count of lines, words and bytes in a file
   ```bash
   ccwc test.txt
   ```

   * Reading file from standard input when no filename is provided
   ```bash
   cat test.txt | ccwc -l
   ```

6. Feel free to test further and add new functionalities
