// Iterative Euclidean Algorithm
// Date: Feb 2023
// Author: tnewman
#include <iostream>

using namespace std;

// function prototype header

int gcd_iterative(int a, int b);

// the main function

int main()
{
    int a, b;
	
	cout << "Please enter a positive integer: \n";
	cin >> a;
	cout << "Please enter another positive integer: \n";
	cin >> b;
	cout << "\nYou entered a = " << a << " b = " << b << endl;
	
	cout << "\nIterative GCD is " << gcd_iterative(a, b) << endl << endl;
}

// Iterative Euclidean Algorithm
// Greatest Common Divisor

/* According to Euclid, to find the GCD of two integers:
1. subtract the smaller from the larger
2. replace the larger with the result of the previous operation
3. repeat until the result is 0

The version of the Euclidean algorithm described above (and by Euclid)
 can take many subtraction steps to find the GCD when one of the given 
 numbers is much bigger than the other. 
 
 A more efficient version of the algorithm shortcuts these steps,
  instead replacing the larger of the two numbers by its remainder 
  when divided by the smaller of the two (with this version, 
  the algorithm stops when reaching a zero remainder). 
  With this improvement, the algorithm never requires more steps 
  than five times the number of digits (base 10) of the smaller integer.

*/
// Input: Positive integers a and b, not both zero
// Output: d = gcd(a, b)
int gcd_iterative(int a, int b)
{
	int c;
	
	if ( b == 0 ) 
		return a;
	
	else
		while ( b != 0 )
		{
			c = b;
			b = a % b; // remainder after division
			a = c;
		}

		return a;
}
