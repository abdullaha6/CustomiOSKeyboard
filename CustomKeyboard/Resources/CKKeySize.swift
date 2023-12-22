//
//  CKKeySize.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-12-04.
//

import Foundation

// TODO: Add space key width
enum CKKeySize: String {
    case iPhone_6s, iPhone_7, iPhone_8, iPhone_SE, iPhone_SE_2nd_gen, iPhone_SE_3rd_gen
    case iPhone_6s_Plus, iPhone_7_Plus, iPhone_8_Plus
    case iPhone_X, iPhone_XS, iPhone_11_Pro
    case iPhone_XS_Max, iPhone_11_Pro_Max
    case iPhone_XR, iPhone_11
    case iPhone_12_mini, iPhone_13_mini
    case iPhone_12, iPhone_12_Pro, iPhone_13, iPhone_13_Pro, iPhone_14, iPhone_14_Pro
    case iPhone_12_Pro_Max, iPhone_13_Pro_Max, iPhone_14_Plus, iPhone_14_Pro_Max, iPhone_15, iPhone_15_Pro
    case iPhone_15_Plus, iPhone_15_Pro_Max
    
    var heightPortrait: Double {
        switch self {
        case .iPhone_6s, .iPhone_7, .iPhone_8, .iPhone_SE, .iPhone_SE_2nd_gen, .iPhone_SE_3rd_gen:
            return 39
        case .iPhone_6s_Plus, .iPhone_7_Plus, .iPhone_8_Plus:
            return 46
        case .iPhone_X, .iPhone_XS, .iPhone_11_Pro:
            return 43
        case .iPhone_XS_Max, .iPhone_11_Pro_Max:
            return 43
        case .iPhone_XR, .iPhone_11:
            return 43
        case .iPhone_12_mini, .iPhone_13_mini:
            return 39
        case .iPhone_12, .iPhone_12_Pro, .iPhone_13, .iPhone_13_Pro, .iPhone_14, .iPhone_14_Pro:
            return 43
        case .iPhone_12_Pro_Max, .iPhone_13_Pro_Max, .iPhone_14_Plus, .iPhone_14_Pro_Max, .iPhone_15, .iPhone_15_Pro:
            return 43
        case .iPhone_15_Plus, .iPhone_15_Pro_Max:
            return 45
        }
    }
    
    var widthPortrait: Double {
        switch self {
        case .iPhone_6s, .iPhone_7, .iPhone_8, .iPhone_SE, .iPhone_SE_2nd_gen, .iPhone_SE_3rd_gen:
            return 26
        case .iPhone_6s_Plus, .iPhone_7_Plus, .iPhone_8_Plus:
            return 36
        case .iPhone_X, .iPhone_XS, .iPhone_11_Pro:
            return 32
        case .iPhone_XS_Max, .iPhone_11_Pro_Max:
            return 36
        case .iPhone_XR, .iPhone_11:
            return 32
        case .iPhone_12_mini, .iPhone_13_mini:
            return 26
        case .iPhone_12, .iPhone_12_Pro, .iPhone_13, .iPhone_13_Pro, .iPhone_14, .iPhone_14_Pro:
            return 32
        case .iPhone_12_Pro_Max, .iPhone_13_Pro_Max, .iPhone_14_Plus, .iPhone_14_Pro_Max, .iPhone_15, .iPhone_15_Pro:
            return 36
        case .iPhone_15_Plus, .iPhone_15_Pro_Max:
            return 36.6
        }
    }
    
    var heightLandscape: Double {
        switch self {
        case .iPhone_6s, .iPhone_7, .iPhone_8, .iPhone_SE, .iPhone_SE_2nd_gen, .iPhone_SE_3rd_gen:
            return 39
        case .iPhone_6s_Plus, .iPhone_7_Plus, .iPhone_8_Plus:
            return 46
        case .iPhone_X, .iPhone_XS, .iPhone_11_Pro:
            return 43
        case .iPhone_XS_Max, .iPhone_11_Pro_Max:
            return 43
        case .iPhone_XR, .iPhone_11:
            return 43
        case .iPhone_12_mini, .iPhone_13_mini:
            return 39
        case .iPhone_12, .iPhone_12_Pro, .iPhone_13, .iPhone_13_Pro, .iPhone_14, .iPhone_14_Pro:
            return 43
        case .iPhone_12_Pro_Max, .iPhone_13_Pro_Max, .iPhone_14_Plus, .iPhone_14_Pro_Max, .iPhone_15, .iPhone_15_Pro:
            return 43
        case .iPhone_15_Plus, .iPhone_15_Pro_Max:
            return 32
        }
    }
    
    var widthLandscape: Double {
        switch self {
        case .iPhone_6s, .iPhone_7, .iPhone_8, .iPhone_SE, .iPhone_SE_2nd_gen, .iPhone_SE_3rd_gen:
            return 26
        case .iPhone_6s_Plus, .iPhone_7_Plus, .iPhone_8_Plus:
            return 36
        case .iPhone_X, .iPhone_XS, .iPhone_11_Pro:
            return 32
        case .iPhone_XS_Max, .iPhone_11_Pro_Max:
            return 36
        case .iPhone_XR, .iPhone_11:
            return 32
        case .iPhone_12_mini, .iPhone_13_mini:
            return 26
        case .iPhone_12, .iPhone_12_Pro, .iPhone_13, .iPhone_13_Pro, .iPhone_14, .iPhone_14_Pro:
            return 32
        case .iPhone_12_Pro_Max, .iPhone_13_Pro_Max, .iPhone_14_Plus, .iPhone_14_Pro_Max, .iPhone_15, .iPhone_15_Pro:
            return 36
        case .iPhone_15_Plus, .iPhone_15_Pro_Max:
            return 65
        }
    }
}

