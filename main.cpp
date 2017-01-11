//Find prime numbers up to...
	#define MAXPRIME 1000000

#include <fstream>
#include <iostream>
#include <vector>

int main()
{
	int i,j,no,lenlist;
	std::vector <int> list;

	i = 7;                // Start at 7
	list.push_back (2);   // Push 2, 3, 5 to list of primes
	list.push_back (3);
	list.push_back (5);

	do {
	    j = 1;
	    no = 0;   // Assume a prime to begin with
	    lenlist = list.size();
	    do {   // Test with previously found primes
	        if (i % list[j] == 0 || (float)i / (float)list[j] < 0.5) {   // Not a prime if remainder is 0 or div. is <0.5
	            j = lenlist;
	            no = 1;    // i is not prime
	        }
	        j = j + 1;
	    } while (j < lenlist);
	    if (no == 0) {  // If prime push to list
	    	list.push_back (i);
	    }
	    i = i + 2;          // Skip even numbers for efficiency
	    if (i % 5 == 0) {   // Skip multiples of 5 for efficiency
	        i = i + 2;
	    }
	} while (i <= MAXPRIME);  // Stop when the MAXPRIME is exceeded
	std::ofstream outputFile ("output.txt", std::ofstream::out);   // Output found primes to file
	if (outputFile.is_open()) {
		std::cout << "Outputting..." << std::endl;
		copy(list.begin(), list.end(), std::ostream_iterator<int>(outputFile , ", "));
	    outputFile << std::endl;
	    outputFile.close();
	    std::cout << "Finished!";
	}
	else std::cout << "Unable to open output file";
	return 0;
}
