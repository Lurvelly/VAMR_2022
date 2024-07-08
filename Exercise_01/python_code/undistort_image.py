import math
import numpy as np

from distort_points import distort_points


def undistort_image(img: np.ndarray,
                    K: np.ndarray,
                    D: np.ndarray,
                    bilinear_interpolation: bool = False) -> np.ndarray:
    """
    Corrects an image for lens distortion.

    Args:
        img: distorted image (HxW)
        K: camera matrix (3x3)
        D: distortion coefficients (4x1)
        bilinear_interpolation: whether to use bilinear interpolation or not
    """
    pass
    """
    Due to pd = (1 + k1 * r^2 + k2 * r^4) * (p - p0) + p0
    It's hard to calculate p according to pd
    """

    h, w = img.shape
    undistort_img = np.zeros([h, w])

    for x in range(w):
        for y in range(h):
            # distort pixel(x,y)
            pd = distort_points(np.array([[x, y]]), D, K)
            u, v = pd[0, :]
            u_1 = math.floor(u)
            v_1 = math.floor(v)
            if bilinear_interpolation:
                # Refer to https://en.wikipedia.org/wiki/Bilinear_interpolation (On the unit square)
                a = u - u_1
                b = v - v_1
                v_2 = v_1 + 1
                u_2 = u_1 + 1
                if 1 <= u < w-1 and 1 <= v < h-1:
                    undistort_img[y, x] = (a * b * img[v_2, u_2] + b * (1-a) * img[v_2, u_1] +
                                           a * (1 - b) * img[v_1, u_2] + (1 - b) * (1 - a) * img[v_1, u_1])
            elif 0 <= u_1 < w and 0 <= v_1 < h:
                undistort_img[y, x] = img[v_1, u_1]

    return undistort_img
