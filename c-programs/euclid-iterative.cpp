// Iterative Euclidean Algorithm
// Date: 11 Oct 2004
// Author: Anatole Ruslanov
#include <iostream>

using namespace std;

int gcd_iterative(int a, int b);

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
			b = a % b;
			a = c;
		}

		return a;
}
