#include<stdio.h>
/* multi line comment begins here
/* this may be incorrect*/
ends here*/
int main()
{
int count, n, a=0, b=1,display;
printf("Enter number of terms: ");
scanf("%d",&n);
printf("Fibonacci Series: %d+%d+", a, b); /* Displaying first two terms */
count=2; /* count=2 because first two terms are already displayed. */
while (count<n)
{
display=a+b;
a=b;
b=display;
++count;
printf("%d+",display);
}
return 0;
}
