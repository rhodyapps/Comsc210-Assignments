// Recursive Euclidean Algorithm
// Date: 11 Oct 2004
// Author: Anatole Ruslanov
#include <iostream>

using namespace std;

int gcd_recursive(int a, int b);

void main()
{
    int a, b;
	
	cout << "Please enter two positive integers:\n";
	cin >> a >> b;
	cout << "\nYou entered a = " << a << " b = " << b << endl;
	
	cout << "\nRecursive GCD is " << gcd_recursive(a, b) << endl << endl;
}


// Recursive Euclidean Algorithm
// Greatest Common Divisor
// Input: Positive integers a and b, not both zero
// Output: d = gcd(a, b)
int gcd_recursive(int a, int b)
{
	if ( b == 0 ) 
		return a;
	
	else
		return gcd_recursive(b, a % b);
}
