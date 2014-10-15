class AddpagesController <ApplicationController
  def two

  end


  def four

    faq1 = Faq.new
    faq1.title = "What is gCamp?"
    faq1.body = "gCamp is an awesome tool that is going to change your life. gCamp is your one stop shop to organize all your tasks
    and documents.  You'll be able to track comments taht you and others make.  gCamp may eventually replace all need for paper and pens in the entire world.
    Well, maybe not, but it's going to be pretty cool."

    faq2 = Faq.new
    faq2.title = "How do I join gCamp?"
    faq2.body = "Right now, gCamp is still in production.  So, there is not a sign up page open to the public, yet!  Your best option is to become
    super best friends with a gCamp developer.  They can be found in the hanging around gSchool during the day and hitting the hottest clubs
    at night."

    faq3 = Faq.new
    faq3.title = "When will gCamp be finished?"
    faq3.body = "gCamp is a work in progress.  That being said, it shoudl be fully functional by December 2014.  Functional, but our developers are going to continue
    to improve the sight for hte foreseeable future.  Check in daily for new features and awesome functionality.  It's going to blow
    your mind.  Organization is only (well, will only) be a click away.  Amazing!"

    @faqs = [faq1, faq2, faq3]

  end

end
