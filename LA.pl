#!/usr/bin/perl

# lexical analysis in perl

# open our input and output files
open (my $inFile, '<', 'in2.tinyl') or die $!;
open (my $outFile, '>', 'output.txt');

# array for storing values from $inFile
my @words;

# array of token names
my @tok = ('IDENT_OR_KEY','S_LITERAL','I_LITERAL','OP_PLUS','OP_MINUS','OP_MULT','OP_DIV','OP_EQ','L_PAREN','R_PAREN','SEMI');

# array of regex values that match above token values in order
my @regs = (qr/^[a-zA-Z_][a-zA-Z0-9_-]*$/, qr/\"([^\\\"]|\\.)*\"/, qr/^\d+$/, qr/^[+]{1}$/, qr/^[-]{1}$/, qr/^[\*]{1}$/, 
qr/^[\/]{1}$/, qr/[\=]{1}/, qr/^[\(]{1}$/, qr/^[\)]{1}$/, qr/^[\;]{1}$/);


# counter element
my $counter == 0;

# while looping inside this file 
while (<$inFile>) 
{
	chomp;	
	# store file values one by one and split them on whitespace, semicolons, left par, and right par
	@words = split(/[\s]|(\;)|(\()|(\))/);	

	# loop through array of elements from input file 
	for (my $i=0; $i <= @words; $i++)
	{			
		# reset counter each time we go to a new @word element
		$counter == 0;		
		
		# if @words[$i] is not a whitespace char
		if(@words[$i] =~ /[^\n\r\t]/)
		{
			# loop through array of regex expressions
			for (my $x=0; $x <= @regs; $x++)
			{
					# counter number of @regs elements we loop through (11 total or @regs.length for anysize)
					$counter++;
					
					# if any elements inside @words($i) array match regex expressions inside @regs($x)
					if(@words[$i] =~ @regs[$x])  
					{		
							# set counter to 0 if found
							$counter == 0;
							
							#my $tokenReg = @regs[$x];	# get the token value that matches			
							#my $tokenName = @tok[$x];  # get the value of the same index of $x inside of @tok							
							print @words[$i], " ",  @tok[$x], "\r\n"; # print the @word and its matching token follew by a new line 															
					}
					# else if element @words[$i] does not match any regex expresion and we have looped thorugh the entire length of @regs
					if((@words[$i] !~ @regs[$x]) && ($counter == @regs.length))  
					{	
						print @words[$i], " ",  "UNDEFINED", "\r\n"; # print the @word and UNDEFINED follew by a new line 
					}
			}
		}
	}
}

# close all our files
close ($inFile);
close ($outFile);

	





	
	
   	

	
	
	
	
	
