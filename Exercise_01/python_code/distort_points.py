import numpy as np


def distort_points(x: np.ndarray,
                   D: np.ndarray,
                   K: np.ndarray) -> np.ndarray:
    """
    Applies lens distortion to 2D points xon the image plane.

    Args:
        x: 2d points (Nx2)
        D: distortion coefficients (4x1)
        K: camera matrix (3x3)
    """
    pass
    # TODO: Your code here
    """
        p0 = [u0, v0].T
        p  = [u, v].T       pixel coordinates point (x)
        pd = [ud, vd].T     distorted pixel coordinates point
        
        Two coefficient model of radial distortion
        r^2 = (u - u0)^2 + (v - v0)^2 is the radial component of p
        pd = (1 + k1 * r^2 + k2 * r^4) (p - p0) + p0
                    ud = (1 + k1 * r^2 + k2 * r^4) (u - u0) + u0
        Expand => 
                    vd = (1 + k1 * r^2 + k2 * r^4) (v - v0) + v0
    """

    u0, v0 = K[0, 2], K[1, 2]
    k1, k2 = D[0], D[1]

    # r^2 = (u - u0)^2 + (v - v0)^2
    xc = x[:, 0] - u0  # u - u0
    yc = x[:, 1] - v0  # v - v0
    r2 = xc ** 2 + yc ** 2

    # Calculate pd
    ud = (1 + k1 * r2 + k2 * (r2 ** 2)) * xc + u0
    vd = (1 + k1 * r2 + k2 * (r2 ** 2)) * yc + v0

    pd = np.stack([ud, vd], axis=-1)

    return pd
