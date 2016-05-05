package model;

import java.util.List;

public class Questions {
	
	private String question;
	List<String> choices;
	private String answer;
	private String options;
	
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<String> getChoices() {
		return choices;
	}
	public void setChoices(List<String> choices) {
		this.choices = choices;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
