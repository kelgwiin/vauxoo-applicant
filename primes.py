"""
Your module documentation here by  kelgwiin
"""


class PrimeClass(object):
    """
    Your class documentation here
    """

    def is_prime(self, num_int):
        """
        Your method documentation here
        """
        is_p = True

        if num_int >= 0 and num_int <= 2:
        	return is_p
        else:
        	for x in range(2, num_int-1):
        		if num_int % x == 0:
        			is_p = False
        			break
		
	return is_p        
