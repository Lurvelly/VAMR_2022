import numpy as np


def pose_vector_to_transformation_matrix(pose_vec: np.ndarray) -> np.ndarray:
    """
    Converts a 6x1 pose vector into a 4x4 transformation matrix.

    Args:
        pose_vec: 6x1 vector representing the pose as [wx, wy, wz, tx, ty, tz]

    Returns:
        T: 4x4 transformation matrix
    """
    pass
    # 3D rotation
    w = pose_vec[:3]
    print(w)
    # 3D translation
    t = pose_vec[3:6]

    # Refer to the statement.pdf of 2.1.2 Axis-angle representation for rotations
    # Calculate the norm of w
    # Notice that ** is the exponentiation operator
    theta = np.sqrt((w**2).sum())

    # Unit vector indicating the axis of rotation
    k = w / theta
    kx, ky, kz = k

    # Calculate the skew symmetric matrix [k]x (also called cross-product matrix)
    K = np.array([
        [0, -kz, ky],
        [kz, 0, -kx],
        [-ky, kx, 0]
    ])

    # Rodrigues' rotation formula
    # R = I + sin(theta)[k]x + (1 - cos(theta))([k]x)^2
    # In NumPy, the @ operator means matrix multiplication.
    R = np.eye(3) + np.sin(theta) * K + (1 - np.cos(theta)) * K @ K

    # return the 4x4 homogeneous transformation matrix
    T = np.eye(4)
    T[:3, :3] = R
    T[:3, 3] = t

    return T
