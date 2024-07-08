import numpy as np

from distort_points import distort_points


def project_points(points_3d: np.ndarray,
                   K: np.ndarray,
                   D: np.ndarray) -> np.ndarray:
    """
    Projects 3d points to the image plane, given the camera matrix,
    and distortion coefficients.

    Args:
        points_3d: 3d points (3xN)
        K: camera matrix (3x3)
        D: distortion coefficients (4x1)

    Returns:
        projected_points: 2d points (2xN)
    """
    pass

    """
        Pw = [X, Y, Z].T    world coordinates point
        points_3d = [R|t] * [X, Y, Z, 1].T
        p  = [u, v].T       pixel coordinates point 
        pd = [ud, vd].T     distorted pixel coordinates point
        lambda * [u, v, 1].T = K * [R|t] * [X, Y, Z, 1].T
    """
    # This formula is equal to
    # p = np.matmul(K, points_3d.transpose()).transpose()
    p = np.matmul(K, points_3d[:, :, None]).squeeze(-1)

    # Normalization, lambda = p[:, 2, None] means select the third column of p
    p /= p[:, 2, None]

    # Apply distortion
    pd = distort_points(p, D, K)

    return pd

#%%
