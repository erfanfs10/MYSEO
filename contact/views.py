from django.shortcuts import render, redirect
from .forms import NoteForm


def contact(request):
    if request.method == 'POST':
        form = NoteForm(request.POST)
        if form.is_valid():
            # Save the form data to the database (creates a new Note instance)
            form.save()
            return redirect('home')  # Redirect to a thank you page after submission
    else:
        form = NoteForm()

    return render(request, 'contact.html', {'form': form})
