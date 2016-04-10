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

        for iterator in xrange(2, num_int-1):
            if num_int % iterator == 0:
                is_p = False
                break
        if num_int < 2:
            is_p = False
        return is_p
