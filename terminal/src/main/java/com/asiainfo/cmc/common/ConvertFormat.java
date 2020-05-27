package com.asiainfo.cmc.common;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.Locale;
import java.text.SimpleDateFormat;
import java.util.List;
public class ConvertFormat {
	// private static NumberFormat numberFormat = NumberFormat.getInstance();
		private static DateFormat dateFormat_CN = new SimpleDateFormat(
				"yyyy年 M月 d日");

		public static String dateFormat_CN(Date d) {
			return (d == null) ? null : dateFormat_CN.format(d);
		}

		public static String formatDate_CN(Object obj) {
			return obj == null ? null : dateFormat_CN.format(obj);
		}

		// input = null, reutrn ""
		public static String toString(Object input) {
			String returnString = "";

			if (input != null)
				returnString = input.toString().trim();

			return returnString;
		}

		// input = null, reutrn null
		public static String parseString(Object input) {
			String returnString = null;

			if (input != null) {
				returnString = input.toString().trim();
				if (returnString.isEmpty()) {
					returnString = null;
				}
			}

			return returnString;
		}

		public static boolean toBoolean(String input, String trueString) {
			boolean returnBoolean = false;

			if (input != null && input.equalsIgnoreCase(trueString))
				returnBoolean = true;

			return returnBoolean;
		}

		public static Boolean parseBoolean(String input, String trueString) {
			Boolean returnBoolean = null;

			if (input != null) {
				if (input.equalsIgnoreCase(trueString))
					returnBoolean = true;
				else
					returnBoolean = false;
			}
			return returnBoolean;
		}

		public static String formatBoolean(boolean input, String trueString,
				String falseString) {
			String returnString = null;

			if (input) {
				returnString = trueString;
			} else {
				returnString = falseString;
			}

			return returnString;
		}

		public static char parseChar(String input) {
			char returnChar = '\0';
			if (input != null && !input.isEmpty())
				returnChar = input.charAt(0);

			return returnChar;
		}

		public static char parseChar(Locale language) {
			char returnChar = '\0';
			if (language != null) {
				if (language.equals(Locale.TAIWAN)
						|| language.equals(Locale.TRADITIONAL_CHINESE))
					returnChar = 'C';
				else if (language.equals(Locale.CHINA)
						|| language.equals(Locale.SIMPLIFIED_CHINESE))
					returnChar = 'S';
				else if (language.equals(Locale.JAPAN)
						|| language.equals(Locale.JAPANESE))
					returnChar = 'J';
				else if (language.equals(Locale.KOREA)
						|| language.equals(Locale.KOREAN))
					returnChar = 'K';
				else
					returnChar = 'E';
			}

			return returnChar;
		}

		public static Locale parseLocale(String language) {
			Locale locale = Locale.ENGLISH;

			if (language != null) {
				if (language.equalsIgnoreCase("C")) {
					locale = Locale.TAIWAN;
				} else if (language.equalsIgnoreCase("S")) {
					locale = Locale.CHINA;
				} else if (language.equalsIgnoreCase("J")) {
					// locale = Locale.JAPANESE;
					locale = Locale.JAPAN;
				} else if (language.equalsIgnoreCase("K")) {
					locale = Locale.KOREAN;
				}
			}
			return locale;
		}

		public static long parseLong(String input) {
			long returnLong = 0;

			if (input != null && !input.isEmpty()) {
				try {
					returnLong = Long.parseLong(input.trim());
				} catch (Exception ex) {
				}
			}

			return returnLong;
		}

		public static int parseInt(String input) {
			int returnInt = 0;

			if (input != null && !input.isEmpty()) {
				try {
					returnInt = Integer.parseInt(input.trim());
				} catch (Exception ex) {
				}
			}

			return returnInt;
		}

		public static Integer parseInteger(String input) {
			Integer returnInteger = null;

			if (input != null && !input.isEmpty()) {
				try {
					returnInteger = new Integer(Integer.parseInt(input.trim()));
				} catch (Exception ex) {
				}
			}

			return returnInteger;
		}

		public static Double parseDouble(String input) {
			NumberFormat numberFormat = NumberFormat.getInstance();
			return parseDouble(numberFormat, input);
		}

		public static Double parseDouble(NumberFormat numberFormat, String input) {
			Double returnDouble = null;

			if (input != null && !input.isEmpty()) {
				try {
					returnDouble = numberFormat.parse(input).doubleValue();
				} catch (Exception ex) {
				}
			}
			return returnDouble;
		}

		public static Character parseCharacter(String input) {
			Character returnCharacter = null;

			if (input != null && !input.trim().isEmpty()) {
				returnCharacter = new Character(input.trim().charAt(0));
			}

			return returnCharacter;
		}

		public static java.sql.Timestamp parseTimestamp(java.util.Date date) {
			java.sql.Timestamp returnTimestamp = null;

			if (date != null) {
				returnTimestamp = new java.sql.Timestamp(date.getTime());
			}

			return returnTimestamp;
		}

		public static java.sql.Date parseDate(java.util.Date date) {
			java.sql.Date returnDate = null;

			if (date != null) {
				returnDate = new java.sql.Date(date.getTime());
			}

			return returnDate;
		}

		public static Date parseDate(DateFormat dateFormatter, String input) {
			Date returnDate = null;

			if (dateFormatter != null && input != null && !input.isEmpty())
				try {
					returnDate = dateFormatter.parse(input.trim());
				} catch (Exception ex) {
				}

			return returnDate;
		}

		// To convert a date format
		public static String convertDate(String dateFormat, java.util.Date date) {
			String convertDate = null;

			if (dateFormat != null && !dateFormat.isEmpty() && date != null) {
				try {
					DateFormat newFormat = new SimpleDateFormat(dateFormat,
							Locale.US);
					convertDate = newFormat.format(date);
				} catch (Exception ex) {
				}
			}

			return convertDate;
		}

		public static String toString(DateFormat dateFormatter, Date input) {
			String returnString = "";

			if (dateFormatter != null && input != null)
				returnString = dateFormatter.format(input);

			return returnString;
		}

		public static String toStringWithNull(DateFormat dateFormatter, Date input) {
			String returnString = null;

			if (dateFormatter != null && input != null)
				returnString = dateFormatter.format(input);

			return returnString;
		}

		public static String getAccountAssignmentDescription(String assignment_type) {
			return assignment_type.equalsIgnoreCase("P") ? "Principal" : "Deputy";
		}

		public static String getStringNullToEmpty(String inputString) {
			if (inputString == null) {
				inputString = "";
			}
			return inputString;
		}

		public static String FormatEmployeeName(String lastName, String middleName,
				String firstName, String assignmentType) {
			return FormatName(lastName, middleName, firstName) + " ("
					+ getAccountAssignmentDescription(assignmentType) + ")";
		}

		public static String FormatName(String lastName, String middleName,
				String firstName) {

			lastName = getStringNullToEmpty(lastName);
			middleName = getStringNullToEmpty(middleName);
			firstName = getStringNullToEmpty(firstName);

			String rtn = lastName;
			boolean commaAdded = false;

			if (rtn != null && !rtn.isEmpty() && firstName != null
					&& !firstName.isEmpty()) {
				rtn += ", " + firstName;
				commaAdded = true;
			}

			if (rtn != null && !rtn.isEmpty() && middleName != null
					&& !middleName.isEmpty()) {
				rtn += (commaAdded) ? " " : ", ";
				rtn += middleName;
			}

			return rtn;
		}

		public static StringBuilder toSelectOptionHTML(List dataList,
				String keyFunctionName, String... displayFunctionName) {
			StringBuilder selectBox = new StringBuilder();

			if (dataList != null && dataList.size() > 0) {
				try {
					Object value = null;
					for (Object data : dataList) {
						selectBox.append("<option");
						selectBox
								.append(" value=\"")
								.append(data.getClass()
										.getMethod(keyFunctionName, new Class[] {})
										.invoke(data, new Object[] {}).toString())
								.append("\"");
						if (displayFunctionName.length > 1) {
							for (String displayFunction : displayFunctionName) {
								value = data.getClass()
										.getMethod(displayFunction, new Class[] {})
										.invoke(data, new Object[] {});
								selectBox
										.append(" "
												+ displayFunction.replaceFirst(
														"get", "") + "=\"")
										.append((value == null) ? "" : value)
										.append("\"");
							}
						}
						selectBox.append(">");
						selectBox.append(data.getClass()
								.getMethod(displayFunctionName[0], new Class[] {})
								.invoke(data, new Object[] {}).toString());
						selectBox.append("</option>");
					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			return selectBox;
		}

		/* keyFunctionName - should be 'get' function */
		public static StringBuilder toJavascriptArray(List dataList,
				String keyFunctionName, String... valueFunctionNames) {
			return toJavascriptArray(true, dataList, keyFunctionName,
					valueFunctionNames);
		}

		public static StringBuilder toJavascriptArray(
				boolean autoChangeJavascriptArrayName, List dataList,
				String keyFunctionName, String... valueFunctionNames) {
			StringBuilder strBuilder = new StringBuilder();
			strBuilder.append("{");

			StringBuilder tempKeyName = new StringBuilder();
			boolean isFirstArrayElement = true;

			Object fieldValue = null;

			if (dataList != null && dataList.size() > 0) {
				try {
					int index = 0;

					for (Object data : dataList) {
						/*
						 * if(index == 0){ for(Method method :
						 * data.getClass().getMethods()){
						 * System.out.println("Name : " + method.getName()); } }
						 */

						if (index != 0)
							strBuilder.append(",");

						strBuilder
								.append("\"")
								.append(data.getClass()
										.getMethod(keyFunctionName, new Class[] {})
										.invoke(data, new Object[] {}).toString())
								.append("\"");
						strBuilder.append(":");

						if (valueFunctionNames.length == 1) {
							strBuilder
									.append("\"")
									.append(data
											.getClass()
											.getMethod(valueFunctionNames[0],
													new Class[] {})
											.invoke(data, new Object[] {})
											.toString()).append("\"");
						} else {

							strBuilder.append("{");

							isFirstArrayElement = true;
							for (int i = 0; i < valueFunctionNames.length; i++) {

								fieldValue = data
										.getClass()
										.getMethod(valueFunctionNames[i],
												new Class[] {})
										.invoke(data, new Object[] {});

								if (fieldValue != null) {

									if (!isFirstArrayElement)
										strBuilder.append(",");

									if (autoChangeJavascriptArrayName) {
										tempKeyName.append(valueFunctionNames[i]
												.substring(3, 4).toLowerCase());
										tempKeyName.append(valueFunctionNames[i]
												.substring(4));

										strBuilder.append("\"")
												.append(tempKeyName.toString())
												.append("\"");

										tempKeyName.setLength(0);
									} else {
										strBuilder.append("\"")
												.append(valueFunctionNames[i])
												.append("\"");
									}

									strBuilder.append(":");

									if (fieldValue instanceof Integer
											|| fieldValue instanceof Double
											|| fieldValue instanceof Long) {
										strBuilder
												.append(fieldValue != null ? fieldValue
														: "");
									} else if (fieldValue instanceof Date) {
										strBuilder
												.append("\"")
												.append("\\/Date(")
												.append(((Date) fieldValue)
														.getTime()).append(")\\/")
												.append("\"");
									} else {// if(fieldValue instanceof String){
										strBuilder
												.append("\"")
												.append(fieldValue != null ? fieldValue
														: "").append("\"");
									}

									isFirstArrayElement = false;

								}

							}

							strBuilder.append("}");
						}

						index++;
					}

				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

			strBuilder.append("}");

			return strBuilder;
		}

		public static String getFileSizeToString(long size) {
			String rtn = "";
			DecimalFormat df = new DecimalFormat("#0.##");
			if (size < 1024) {// bytes
				rtn = size + " bytes";
			} else if (size < (1024 * 1024)) {// KB
				rtn = (df.format((double) size / 1024)) + " KB";
			} else if (size < (1024 * 1024 * 1024)) {// MB
				rtn = (df.format((double) size / 1024 / 1024)) + " MB";
			} else if (size < ((long) 1024 * 1024 * 1024 * 1024)) {// GB
				rtn = (df.format((double) size / 1024 / 1024 / 1024)) + " GB";
			}
			return rtn;
		}

		/*
		 * public static String sanitizeHtmlTag(String input) { String rtn = null;
		 * if(input != null) rtn = input.replaceAll("&", "&amp;") .replaceAll("<",
		 * "&lt;") .replaceAll(">", "&gt;") .replaceAll("'", "&#039;")
		 * .replaceAll("\"", "&#034;"); return rtn; }
		 */

		// public static String toDesc(Object input) {
		// StringBuilder strBuilder = new StringBuilder();
		// String rtn = "";
		// int obj_size = input.toString().length();
		//
		// strBuilder.append("size = " + obj_size);
		// strBuilder.append("className = " + input.getClass().getName());
		//
		// return strBuilder.toString();
		// }
}
